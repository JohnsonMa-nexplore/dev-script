import clipboard from "clipboardy";
import { execSync } from "child_process";

const repoDir = process.argv[2] || process.cwd();
const execOpts = { encoding: "utf-8", cwd: repoDir };

const branch = execSync("git branch --show-current", execOpts).trim();

let pr;
try {
  pr = JSON.parse(
    execSync(`gh pr view '${branch}' --json title,url,number`, execOpts),
  );
} catch {
  console.error("No PR found for branch:", branch);
  process.exit(1);
}

const message = [`🔀 PR #${pr.number}`, `📌 ${pr.title}`, `🔗 ${pr.url}`].join(
  "\n",
);

console.log(message);
console.log(" - Copied to clipboard -");
clipboard.writeSync(message);
