import clipboard from "clipboardy";
import { execSync } from "child_process";

const prs = JSON.parse(
  execSync(
    "gh search prs --author=@me --state=open --review=required --draft=false --json number,title,url",
    { encoding: "utf-8" },
  ),
);

if (!prs.length) {
  console.log("No pending PRs found.");
  process.exit(0);
}

const lines = prs.map(
  (pr) => `🔀 PR #${pr.number}\n📌 ${pr.title}\n🔗 ${pr.url}`,
);

const message = `📋 Pending PRs for Review\n\n${lines.join("\n\n")}`;

console.log(message);
console.log("\n - Copied to clipboard -");
clipboard.writeSync(message);
