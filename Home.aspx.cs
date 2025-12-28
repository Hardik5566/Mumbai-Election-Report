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
            throw;
            //Response.Redirect("Message.aspx?ex=" + ex.Message);
        }
    }

    public void bind_data()
    {
        try
        {
            DataSet ds = BAL_Report.dis_admin_dash();
            if (ds.Tables.Count > 0)
            {

                //------- Ward ---------//
                lbl_active_ward.Text = ds.Tables[0].Rows[0]["total_ward_active"].ToString();
                lbl_not_active_ward.Text = ds.Tables[0].Rows[0]["total_ward_inactive"].ToString();


                //------- Booth ---------//
                lbl_total_booth.Text = ds.Tables[1].Rows[0]["total_booth"].ToString();
                lbl_active_booth.Text = ds.Tables[1].Rows[0]["booth_active"].ToString();
                lbl_not_active_booth.Text = ds.Tables[1].Rows[0]["not_active_booth"].ToString();

                //------- User ---------//
                lbl_total_user.Text = ds.Tables[2].Rows[0]["total_user"].ToString();
                lbl_active_total_user.Text = ds.Tables[2].Rows[0]["total_active_user"].ToString();
                lbl_inactive_total_user.Text = ds.Tables[2].Rows[0]["total_inactive_user"].ToString();
                BindUserChart(Convert.ToInt32(ds.Tables[2].Rows[0]["total_user"].ToString()), Convert.ToInt32(ds.Tables[2].Rows[0]["total_active_user"].ToString()));

                //------- Zone Wise Active User ---------//
                list_zone_user.DataSource = ds.Tables[3];
                list_zone_user.DataBind();

                BindPhonebookVoterChart(10354316, Convert.ToInt32(ds.Tables[4].Rows[0]["phonebook_match_voters"].ToString()));

                //------- Zone Wise Active User ---------//
                lbl_total_survey.Text = ds.Tables[5].Rows[0]["survey_done"].ToString();
                lbl_postive.Text = ds.Tables[5].Rows[0]["positive"].ToString();
                lbl_negetive.Text = ds.Tables[5].Rows[0]["negative"].ToString();
                lbl_doubtful.Text = ds.Tables[5].Rows[0]["doubtful"].ToString();
                lbl_cantsay.Text = ds.Tables[5].Rows[0]["cant_say"].ToString();


                bind_survey_bar_chart(
                        Convert.ToInt32(ds.Tables[5].Rows[0]["positive"].ToString()),
                        Convert.ToInt32(ds.Tables[5].Rows[0]["negative"].ToString()),
                        Convert.ToInt32(ds.Tables[5].Rows[0]["doubtful"].ToString()),
                        Convert.ToInt32(ds.Tables[5].Rows[0]["cant_say"].ToString())

                        );

                //--------------- Slip ------------------//
                BindSlipChart(10354316, 0);

                //lbl_phonebook_user.Text = ds.Tables[0].Rows[0]["phonebook_match_user"].ToString();
                //lbl_phonebook_voter.Text = ds.Tables[0].Rows[0]["phonebook_match_voter"].ToString();

                //bind_chart(ds.Tables[0].Rows[0]["phonebook_match_voter"].ToString());
            }
        }
        catch (Exception)
        {

            throw;
        }
    }

    public void BindUserChart(int total, int active)
    {
        int inactive = total - active;

        // Calculate remaining value for pie segments if needed
        // Here, we assume total = active + notActive
        string script = string.Format(@"
        var ctx = document.getElementById('usersPie').getContext('2d');
        var userChart = new Chart(ctx, {{
            type: 'doughnut',
            data: {{
                datasets: [{{
                    data: [{0}, {1}, {2}],
                    backgroundColor: ['#007bff', '#28a745', '#dc3545']
                }}]
            }},
            options: {{
                responsive: true,
                plugins: {{
                    legend: {{
                        display: false
                    }},
                    tooltip: {{
                        enabled: true
                    }}
                }}
            }}
        }});
    ", total, active, inactive);

        ClientScript.RegisterStartupScript(this.GetType(), "userChart", script, true);
    }

    public void BindPhonebookVoterChart(int totalVoter, int matchedVoter)
    {
        int remainingVoter = totalVoter - matchedVoter;

        string script = string.Format(@"
        var ctx = document.getElementById('phonebookChart').getContext('2d');
        new Chart(ctx, {{
            type: 'doughnut',
            data: {{
                datasets: [{{
                    data: [{0}, {1}],
                    backgroundColor: ['#007bff', '#28a745']
                }}]
            }},
            options: {{
                responsive: true,
                plugins: {{
                    legend: {{
                        display: false
                    }},
                    tooltip: {{
                        enabled: true
                    }}
                }}
            }}
        }});
    ", remainingVoter, matchedVoter);

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "phonebookChart",
            script,
            true
        );
    }

    public void BindSlipChart(int totalVoter, int slipsend)
    {
        int remainingVoter = totalVoter - slipsend;

        string script = string.Format(@"
        var ctx = document.getElementById('SlipPie').getContext('2d');
        new Chart(ctx, {{
            type: 'doughnut',
            data: {{
                datasets: [{{
                    data: [{0}, {1}],
                    backgroundColor: ['#d13a45', '#28a745']
                }}]
            }},
            options: {{
                responsive: true,
                plugins: {{
                    legend: {{
                        display: false
                    }},
                    tooltip: {{
                        enabled: true
                    }}
                }}
            }}
        }});
    ", remainingVoter, slipsend);

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "SlipPie",
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
        string script = @"
        var ctx = document.getElementById('surveyBarChart').getContext('2d');

        if (window.surveyChart) {
            window.surveyChart.destroy();
        }

        window.surveyChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Positive', 'Negative', 'Doubtful', 'Cant Say'],
                datasets: [{
                    data: [" + positive + ", " + negative + ", " + doubtful + ", " + cantSay + @"],
                    backgroundColor: [
                        '#28a745',
                        '#dc3545',
                        '#fd7e14',
                        '#6c757d'
                    ],
                    borderRadius: 6,
                    barThickness: 40
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    x: {
                        grid: {
                            display: false
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            precision: 0
                        }
                    }
                }
            }
        });
    ";

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "surveyBarChart",
            script,
            true
        );
    }




}