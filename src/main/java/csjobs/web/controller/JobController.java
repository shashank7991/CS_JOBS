package csjobs.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.FileDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
public class JobController {

	@Autowired
	private JobDao jobDao;

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private FileDao fileDao;

	@Autowired
	private UserDao userDao;

	@RequestMapping({ "/index.html", "/job/list.html" })
	public String list(ModelMap models) {
		models.put("openJobs", jobDao.getOpenJobs());
		return "job/list";
	}

	@RequestMapping("/job/view.html")
	public String view(@RequestParam Long id, ModelMap models) {
		models.put("job", jobDao.getJob(id));
		models.put("r1", jobDao.getJob(id).getCommitteeMembers());
		return "job/view";
	}

	@RequestMapping("/job/viewjob.html")
	public String viewjob(@RequestParam Long id, ModelMap models) {
		models.put("job", jobDao.getJob(id));
		models.put("r1", jobDao.getJob(id).getCommitteeMembers());
		return "job/viewjob";
	}

	@RequestMapping(value = "/job/add.html", method = RequestMethod.GET)
	public String addJob(ModelMap models) {
		models.put("job", new Job());
		models.put("reviewers", userDao.getReviwers());
		return "job/add";
	}

	@RequestMapping(value = "/job/add.html", method = RequestMethod.POST)
	public String addJob(@ModelAttribute Job job, BindingResult bindingResult,
			SessionStatus sessionStatus, @RequestParam Long cmtchair,
			@RequestParam List<Long> committeeMembers) throws Exception{

		job.setCommitteeChair(userDao.getUser(cmtchair));
		List<User> cmtmembers = job.getCommitteeMembers();
		for (int i = 0; i < committeeMembers.size(); i++) {
			cmtmembers.add(userDao.getUser(committeeMembers.get(i)));
		}
		if (committeeMembers.contains(cmtchair) == false) {
			cmtmembers.add(userDao.getUser(cmtchair));
		}
		job.setCommitteeMembers(cmtmembers);
		job = jobDao.saveJob(job);
		sessionStatus.setComplete();

		return "redirect:/admin.html";
	}

	@RequestMapping(value = "/job/edit.html", method = RequestMethod.GET)
	public String editJob(ModelMap models, @RequestParam Long id) {

		models.put("job", jobDao.getJob(id));
		models.put("reviewers", userDao.getReviwers());
		return "job/add";
	}

	@RequestMapping(value = "/job/edit.html", method = RequestMethod.POST)
	public String edit(@ModelAttribute Job job, BindingResult bindingResult,
			SessionStatus sessionStatus, @RequestParam Long cmtchair,
			@RequestParam List<Long> committeeMembers) {

		job.setCommitteeChair(userDao.getUser(cmtchair));
		List<User> cmtmembers = job.getCommitteeMembers();
		for (int i = 0; i < committeeMembers.size(); i++) {
			cmtmembers.add(userDao.getUser(committeeMembers.get(i)));
		}
		if (committeeMembers.contains(cmtchair) == false) {
			cmtmembers.add(userDao.getUser(cmtchair));
		}
		job.setCommitteeMembers(cmtmembers);
		job = jobDao.saveJob(job);
		sessionStatus.setComplete();

		return "redirect:/admin.html";
	}
}
