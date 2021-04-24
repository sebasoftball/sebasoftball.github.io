<!--#include virtual="variables.aspx"-->
<%
System.IO.StringWriter stringWriter = new System.IO.StringWriter();
String currentFile = Request.ServerVariables["SCRIPT_NAME"];
Dictionary<string, Dictionary<string, string>> categories =  new Dictionary<string, Dictionary<string, string>>();

// Links for the current seasons results
Dictionary<string, string> currentSeason =  new Dictionary<string, string>();
currentSeason.Add("schedule.aspx", "Schedule");
currentSeason.Add("standings.aspx", "Standings");
categories.Add("Results", currentSeason);

// League information
Dictionary<string, string> leagueInfo =  new Dictionary<string, string>();
leagueInfo.Add("faq.aspx", "FAQ");
leagueInfo.Add("rules.aspx", "League Rules");
leagueInfo.Add("rulechanges.aspx", "Rule Changes");
categories.Add("Information", leagueInfo);

// Links for contacts
Dictionary<string, string> contacts =  new Dictionary<string, string>();
contacts.Add("teams.aspx", "Team Contacts");
contacts.Add(String.Format("mailto:{0}", CommishEmail), String.Format("Commissioner: <br/> {0}", Commish));
if (!AsstCommish.Equals("")) {
	contacts.Add(String.Format("mailto:{0}", AsstCommishEmail), String.Format("Commissioner: <br/> {0}", AsstCommish));
}
categories.Add("Contacts", contacts);

using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
{
   Response.Write("<ul id=\"menubar\">"); // Begin Menubar div
   foreach (KeyValuePair<string, Dictionary<string, string>> category in categories) {
		Response.Write(String.Format("<li>{0}", category.Key)); // Begin category
		Response.Write("<ul class=\"dropdown\">");
		foreach (KeyValuePair<string, string> page in category.Value) {
			Response.Write(String.Format("<li><a href=\"{0}\">{1}</a></li>", page.Key, page.Value));
		}
		Response.Write("</ul></li>"); // End category
   }
   Response.Write("</ul>");; // End div
}
%>
<p class="clearLine"></p>