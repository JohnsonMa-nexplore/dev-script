import "dotenv/config";

const username = process.env.JIRA_USERNAME;
const token = process.env.JIRA_TOKEN;
const baseURL = process.env.JIRA_URL;
const url = (id) => `${baseURL}/rest/api/latest/issue/${id}`;

let headers = new Headers();
headers.append(
  "Authorization",
  "Basic " + Buffer.from(username + ":" + token).toString("base64")
);

export function getInfo(issueId) {
  return fetch(url(issueId), {
    method: "GET",
    headers: headers,
  });
}
