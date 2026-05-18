alias bn='func_bn'
func_bn() {
    pushd ~/dev/dev-script/github/helper > /dev/null; 
    npm run generate-branch-name "$@" --silent; 
    popd > /dev/null;
}

alias pr='func_pr'
func_pr() {
    pushd ~/dev/dev-script/github/helper > /dev/null; 
    npm run generate-pr-message "$@" --silent; 
    popd > /dev/null;
}

alias tpr='func_tpr'
func_tpr() {
    local repo_dir="$PWD"
    pushd ~/dev/dev-script/github/helper > /dev/null;
    npm run generate-teams-message --silent -- "$repo_dir";
    popd > /dev/null;
}

alias open-pr='func_open_pr'
func_open_pr() {
    ticket=$(ticket-number)
    branch_name=$(bn "$ticket")
    pr_message=$(pr "$ticket")

    title=$(echo "$pr_message" | grep -o '\*\*SOCO-.*')
    title=$(echo "$title" | tr -d '*')
    gh pr create --fill --title "$title" --body "$pr_message" --draft
}

alias commit-ticket='func_commit_ticket'
func_commit_ticket() {
    ticket_number=$(git branch --show-current | grep -ioE ".+#" | cut -d# -f1)
    if [ -z "$ticket_number" ]; then
        ticket_number="SOCO"
    fi
    commit_msg="$ticket_number: $1"
    git commit -m "$commit_msg"
}

alias az-forward='kubectl port-forward pods/postgresql-0 5444:5432 -n'
alias mina-dump='sh /Users/johnsonma/dev/dev-script/database/mina-db-clone/dump/run.sh'
alias mina-restore='sh /Users/johnsonma/dev/dev-script/database/mina-db-clone/restore/run.sh'

# MINA
alias local-client='echo file://~/Projects/MINA/e2ep-mina-backend/service-client/dist | pbcopy'

alias ppr='func_ppr'
func_ppr() {
    pushd ~/dev/dev-script/github/helper > /dev/null;
    npm run pending-prs --silent;
    popd > /dev/null;
}

alias dev-help='func_dev_help'
func_dev_help() {
    echo ""
    echo "Available commands:"
    echo "  bn <ticket>        - Generate branch name from ticket number"
    echo "  pr <ticket>        - Generate PR message from ticket number"
    echo "  tpr                - Generate Teams message for current repo PRs"
    echo "  open-pr            - Create a draft PR with auto-generated title/body"
    echo "  commit-ticket <msg>- Commit with ticket number prefix from branch name"
    echo "  ppr                - List pending PRs"
    echo "  az-forward <ns>    - Port-forward to Azure PostgreSQL pod"
    echo "  mina-dump          - Dump MINA database"
    echo "  mina-restore       - Restore MINA database"
    echo "  local-client       - Copy local MINA client dist path to clipboard"
    echo "  dev-help           - Show this help message"
    echo ""
}
