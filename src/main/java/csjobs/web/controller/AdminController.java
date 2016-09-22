package csjobs.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
public class AdminController {

	@Autowired
	private JobDao jobDao;

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private UserDao userDao;


	@RequestMapping(value = "/admin/joblist.html")
	public String joblist(ModelMap models) {
		models.put("jobs", jobDao.getOpenJobs());
		return "admin/joblist";
	}

	
	@RequestMapping(value = "/admin/listofuser.html")
	public String lisofuser(ModelMap models, @RequestParam Long id) {
		models.put("applications", applicationDao.getApplications(id));
		return "admin/listofuser";
	}

	@RequestMapping("/admin/details.html")
	public String details(@RequestParam Long id, @RequestParam Long jid,
			ModelMap models) {
		models.put(
				"application",
				applicationDao.getApplication(jobDao.getJob(jid),
						userDao.getUser(id)));
		return "/admin/details";
	}
}
