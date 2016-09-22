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
public class ReviewerController {

	@Autowired
	private JobDao jobDao;

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/reviewer/viewjob.html")
	public String viewjob1(@RequestParam Long id, ModelMap models) {
		models.put("job", jobDao.getJob(id));
		models.put("r1", jobDao.getJob(id).getCommitteeMembers());
		return "reviewer/viewjob";
	}

	@RequestMapping(value = "/reviewer/listofuser.html")
	public String lisofuser(ModelMap models, @RequestParam Long id) {

		models.put("applications", applicationDao.getApplications(id));
		return "reviewer/listofuser";
	}
	
	 @RequestMapping("/reviewer/details.html")
	    public String details( @RequestParam Long id,@RequestParam Long jid, ModelMap models )
	    {
		 	models.put( "application", applicationDao.getApplication(jobDao.getJob(jid), userDao.getUser(id)));
	        return "/reviewer/details";
	    }
}
