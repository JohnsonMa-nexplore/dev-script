import clipboard from "clipboardy";
import { execSync } from "child_process";

const prs = JSON.parse(
  execSync(
    "gh search prs --author=@me --state=open --review=required --draft=false --json number,title,url,createdAt",
    { encoding: "utf-8" },
  ),
);

if (!prs.length) {
  console.log("No pending PRs found.");
  process.exit(0);
}

function timeSince(date) {
  const seconds = Math.floor((Date.now() - new Date(date)) / 1000);
  const days = Math.floor(seconds / 86400);
  if (days >= 1) return `${days}d ago`;
  return null;
}

const lines = prs.map((pr) => {
  const age = timeSince(pr.createdAt);
  const parts = [`🔀 PR #${pr.number}`, `📌 ${pr.title}`];
  if (age) parts.push(`⏳ ${age}`);
  parts.push(`🔗 ${pr.url}`);
  return parts.join("\n");
});

const message = `📋 Pending PRs for Review\n\n${lines.join("\n\n")}`;

console.log(message);
console.log("\n - Copied to clipboard -");
clipboard.writeSync(message);
