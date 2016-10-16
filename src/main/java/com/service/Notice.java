package com.service;

import java.lang.reflect.Method;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;

import com.di.Action;
import com.model.DataBean;

@Controller
public class Notice implements Action {

	@Resource
	DataBean databean;

	@Resource
	SqlSessionTemplate sqlSessionTemplate;

	Method method;

	@Override
	public void execute() throws Throwable {
		this.databean.setMenuList(this.sqlSessionTemplate.selectList(
				"mm.subMenu", this.databean));
		this.databean.setTopList(this.sqlSessionTemplate.selectList(
				"mm.topMenu", this.databean));
		this.method = getClass()
				.getDeclaredMethod(this.databean.getNoticekey());
		this.method.invoke(this);

	}

	public void info() {
	}

	public void question() {
	}

	public void noticeboard() {
		this.pajing();

		this.databean.setInsertboard((List) sqlSessionTemplate.selectList(
				"mm.notice", this.databean));
	}

	public void qna() {

		this.pajing();
		this.databean.setInsertboard((List) sqlSessionTemplate.selectList(
				"mm.qna", this.databean));

	}

	public void pajing() {
		Integer count = null;

		count = sqlSessionTemplate
				.selectOne("mm.noticeCounting", this.databean);

		this.databean.setTotalPage(count / this.databean.getLimit());

		if (count % this.databean.getLimit() > 0) {
			this.databean.setTotalPage(this.databean.getTotalPage() + 1);
		}

		if (this.databean.getNoticekey().equals("qna")) {
			this.databean.setStartPage((this.databean.getQnaPage() - 1)
					/ this.databean.getPageLimit()
					* this.databean.getPageLimit() + 1);

		} else if (this.databean.getNoticekey().equals("noticeboard")) {

			this.databean.setStartPage((this.databean.getNoticePage() - 1)
					/ this.databean.getPageLimit()
					* this.databean.getPageLimit() + 1);
		}

		this.databean.setEndPage(this.databean.getStartPage()
				+ this.databean.getPageLimit() - 1);
		if (this.databean.getTotalPage() < this.databean.getEndPage()) {
			this.databean.setEndPage(this.databean.getTotalPage());

		}

	}

	public void detail() {
		upcnt();
		this.databean.setInsertboard(((List) sqlSessionTemplate.selectList(
				"mm.detail", this.databean)));

	}

	public void upcnt() {

		sqlSessionTemplate.update("mm.cntupdate", this.databean);

	}

	public void write() {
	}

	public void comwrite() {

		Object ll = null;
		ll = this.databean;
		// 오브젝트는 항상 널인지를 비교 그다음문자열과 숫자를비교

		this.databean.setPentionResult(this.sqlSessionTemplate.selectOne(
				"mm.idsSuch", this.databean));

		if (this.databean.getPentionResult() == null
				|| this.databean.getPentionResult().equals("null")) {

			this.databean.setName(((DataBean) ll).getName());
			this.databean.setTitle(((DataBean) ll).getTitle());
			this.databean.setContent(((DataBean) ll).getContent());
			this.databean.setServiceKey(((DataBean) ll).getServiceKey());
			this.databean.setName(((DataBean) ll).getName());

			this.sqlSessionTemplate.insert("mm.insertOneOne", this.databean);

		} else {

			this.databean.setName(((DataBean) ll).getName());
			this.databean.setTitle(((DataBean) ll).getTitle());
			this.databean.setContent(((DataBean) ll).getContent());
			this.databean.setServiceKey(((DataBean) ll).getServiceKey());
			this.databean.setName(((DataBean) ll).getName());

			this.sqlSessionTemplate.insert("mm.insertOne", this.databean);

		}

		this.databean.setBoardKey(this.databean.getServiceKey());

		detail();

	}

	public void reply() {
	}

	public void replycom() {

		Object res = null;
		res = sqlSessionTemplate.update("mm.reply", this.databean);

		if (res != null) {
			res = sqlSessionTemplate.insert("mm.replycom", this.databean);

			this.databean.setBoardKey(this.databean.getServiceKey());
			detail();

		}
	}

	public void modify() {
	}

	public void noticeModifyWrite() {

		this.sqlSessionTemplate.update("mm.updateWrite", this.databean);
		this.databean.setBoardKey(this.databean.getServiceKey());
		detail();

	}

	public void noticedelete() {

		Integer res = null;
		res = sqlSessionTemplate.selectOne("mm.deleteselect", this.databean);
		if (res != null) {
			// 원글이면 res가 1이고 seq가 0이다

			if (res < 2 && this.databean.getSeq().equals(0)) { // 원글이고 댓글이 없을떄
				this.sqlSessionTemplate
						.delete("mm.noticedelete", this.databean);
			} else if (res > 1 && this.databean.getSeq().equals(0)) {
				// 댓글수가 0이 아니고 원글일때
				this.databean.setTitle("삭제된게시물입니다");
				this.databean.setContent("");
				sqlSessionTemplate.update("mm.noticedeleteUp", this.databean);

			} else {
				// 나머지경우
				this.sqlSessionTemplate
						.delete("mm.noticedelete", this.databean);
				res = sqlSessionTemplate.selectOne("mm.deleteselect",
						this.databean);

				if (res == 1) {
					DataBean check = new DataBean();
					check.setInsertboard((List) sqlSessionTemplate.selectList(
							"mm.check", this.databean));
					for (int i = 0; i < check.getInsertboard().size(); i++) {
						if (check.getInsertboard().get(i).getTitle()
								.equals(this.databean.getTitles())
								&& check.getInsertboard().get(i).getSeq()
										.equals(0)) {

							this.databean.setIds(check.getInsertboard().get(i)
									.getIds());
							this.databean.setServiceKey("qna");
							this.sqlSessionTemplate.delete("mm.noticedelete",
									this.databean);
						}

					}

				}
			}
		}

		if (this.databean.getServiceKey().equals("qna")) {

			this.databean.setNoticekey("qna");

			this.databean.setQnaPage(1);

			this.databean.setBoardKey("");

			this.databean.setServiceKey("qna");

			pajing();

			this.databean.setInsertboard((List) sqlSessionTemplate.selectList(
					"mm.qna", this.databean));

			this.databean.setServiceKey("qna");

			this.databean.setBoardKey("");

		} else {

			this.databean.setNoticekey("noticeboard");

			this.databean.setNoticePage(1);

			this.databean.setBoardKey("");

			this.databean.setServiceKey("noticeboard");

			pajing();

			this.databean.setInsertboard((List) sqlSessionTemplate.selectList(
					"mm.notice", this.databean));

			this.databean.setServiceKey("noticeboard");

			this.databean.setBoardKey("");
		}

		this.databean.setMain("noticeView");

	}

}