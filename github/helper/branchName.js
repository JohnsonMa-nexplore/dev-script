import clipboard from "clipboardy";
import { getInfo } from "./client.js";

const issueId = process.argv[2];
const copyToClipboard = !!process.argv[3];

const template = (key, summary) => {
  return `${key}#${summary.toLowerCase().replaceAll(" ", "-")}`;
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
