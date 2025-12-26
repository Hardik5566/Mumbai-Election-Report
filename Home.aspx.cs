using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Home : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
               bind_data();

              
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("Message.aspx?ex=" + ex.Message);
        }
    }

    public void bind_data()
    {
        try
        {
            DataSet ds = BAL_Report.dis_admin_dash();
            if (ds.Tables.Count > 0)
            {
                lbl_total_user.Text = ds.Tables[0].Rows[0]["total_user"].ToString();
                lbl_active_user.Text = ds.Tables[0].Rows[0]["total_active"].ToString();
                lbl_inactive_user.Text = ds.Tables[0].Rows[0]["total_inactive"].ToString();

                lbl_total_survey.Text = ds.Tables[1].Rows[0]["survey_done"].ToString();
                lbl_phonebook_user.Text = ds.Tables[0].Rows[0]["phonebook_match_user"].ToString();
                lbl_phonebook_voter.Text = ds.Tables[0].Rows[0]["phonebook_match_voter"].ToString();

                bind_chart(ds.Tables[0].Rows[0]["phonebook_match_voter"].ToString());

                bind_survey_bar_chart(
                        Convert.ToInt32(ds.Tables[1].Rows[0]["positive"].ToString()),
                        Convert.ToInt32(ds.Tables[1].Rows[0]["negative"].ToString()),
                        Convert.ToInt32(ds.Tables[1].Rows[0]["doubtful"].ToString()),
                        Convert.ToInt32(ds.Tables[1].Rows[0]["cant_say"].ToString())

                        );
            }
        }
        catch (Exception)
        {

            throw;
        }
    }

    public void bind_chart(string match_Voter)
    {
        int totalVoter = 10354316; // Replace with your DB value
        int matchVoter = Convert.ToInt32(match_Voter);  // Replace with your DB value
        int unmatchVoter = totalVoter - matchVoter;

        string script = string.Format(@"
            var ctx = document.getElementById('voterChart').getContext('2d');
            var voterChart = new Chart(ctx, {{
                type: 'pie',
                data: {{
                    labels: ['Matched Voter', 'Unmatched Voter'],
                    datasets: [{{
                        data: [{0}, {1}],
                        backgroundColor: ['#28a745', '#dc3545']
                    }}]
                }},
                options: {{
                    responsive: true,
                    plugins: {{
                        legend: {{
                            position: 'bottom'
                        }}
                    }}
                }}
            }});", matchVoter, unmatchVoter);

        ClientScript.RegisterStartupScript(this.GetType(), "voterChart", script, true);
    }

    public void bind_survey_chart(
    int positive,
    int negative,
    int doubtful,
    int cantSay
)
    {
        string script = string.Format(@"
        var ctx2 = document.getElementById('surveyChart').getContext('2d');
        var surveyChart = new Chart(ctx2, {{
            type: 'pie',
            data: {{
                labels: ['Positive', 'Negative', 'Doubtful', 'Can’t Say'],
                datasets: [{{
                    data: [{0}, {1}, {2}, {3}],
                    backgroundColor: [
                        '#198754',  // green
                        '#dc3545',  // red
                        '#ffc107',  // yellow
                        '#6c757d'   // gray
                    ]
                }}]
            }},
            options: {{
                responsive: true,
                plugins: {{
                    legend: {{
                        position: 'bottom'
                    }}
                }}
            }}
        }});",
            positive, negative, doubtful, cantSay
        );

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "surveyChart",
            script,
            true
        );
    }


    public void bind_survey_bar_chart(
     int positive,
     int negative,
     int doubtful,
     int cantSay
 )
    {
        string script = string.Format(@"
        var ctx3 = document.getElementById('surveyBarChart').getContext('2d');
        var surveyBarChart = new Chart(ctx3, {{
            type: 'bar',
            data: {{
                labels: ['Positive', 'Negative', 'Doubtful', 'Cant Say'],
                datasets: [{{
                    label: 'Survey Count',
                    data: [{0}, {1}, {2}, {3}],
                    backgroundColor: [
                        '#198754',
                        '#dc3545',
                        '#ffc107',
                        '#6c757d'
                    ]
                }}]
            }},
            options: {{
                responsive: true,
                scales: {{
                    y: {{
                        beginAtZero: true,
                        ticks: {{
                            precision: 0
                        }}
                    }}
                }},
                plugins: {{
                    legend: {{
                        display: false
                    }},
                    datalabels: {{
                        anchor: 'end',
                        align: 'top',
                        color: '#000',
                        font: {{
                            weight: 'bold',
                            size: 13
                        }},
                        formatter: function(value) {{
                            return value;
                        }}
                    }}
                }}
            }},
            plugins: [ChartDataLabels]
        }});",
            positive, negative, doubtful, cantSay
        );

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "surveyBarChart",
            script,
            true
        );
    }



}