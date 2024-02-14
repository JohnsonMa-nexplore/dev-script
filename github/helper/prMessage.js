import clipboard from "clipboardy";
import { getInfo } from "./client.js";

const issueId = process.argv[2];
const copyToClipboard = !!process.argv[3];

const template = (key, summary) => {
  const text = [];
  text.push(`**${key} - ${summary}**`);
  text.push(`[Link to Issue](https://nexplore.atlassian.net/browse/${key})`);
  text.push("");
  text.push("**Is this a complete feature?**");
  text.push("Yes/No");
  text.push("");
  text.push("**Description**");
  text.push("Placeholder");
  text.push("");
  text.push("**Remarks**");
  text.push("N/A");
  text.push("");

  return text.join("\n");
};

getInfo(issueId)
  .then((response) => response.json())
  .then(({ key, fields: { summary } }) => {
    const t = template(key, summary);
    console.log(t);
    if (copyToClipboard) {
      console.log(" - Copied to clipboard -");
      clipboard.writeSync(t);
    }
  });
