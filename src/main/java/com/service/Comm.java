package com.service;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;

import com.di.Action;
import com.model.DataBean;
import com.model.File_All;

@Controller
public class Comm implements Action {


	@Resource
	DataBean databean;

	@Resource
	SqlSessionTemplate sqlSessionTemplate;

	Method method;

	@Resource
	File_All file;

	@Override
	public void execute() throws Throwable {
		this.databean.setTopList(this.sqlSessionTemplate.selectList(
				"mm.topMenu", this.databean));

		this.method = getClass().getDeclaredMethod(this.databean.getService());

		this.method.invoke(this);

	}

	public void comSerch() {
		// 커뮤니티 같은 경우에는 글쓰기와, 글 수정, 글 삭제 등 여러가지 일이 발생하므로, 처음엔 comSerch값으로 리스트를
		// 뿌려주어야 하고, 글쓰기를 누르게 되면, 주소값을 변경하여 글을 쓰거나, 삭제하거나 해주도록 한다.
		//System.out.println(this.databean.getFids() + "글번호");
		Integer lol = null;

		lol = sqlSessionTemplate.selectOne("mm.freecount", this.databean);

		this.databean.setFstart((this.databean.getFpage() - 1)
				* this.databean.getFlimit() + 1);

		this.databean.setFend(this.databean.getFpage()
				* this.databean.getFlimit());

		this.databean.setFtotalpage(lol / this.databean.getFlimit());

		if (lol % this.databean.getLimit() > 0) {
			this.databean.setFtotalpage(this.databean.getFtotalpage() + 1);
		}

		this.databean.setFstartpage((this.databean.getFpage() - 1)
				/ this.databean.getFpagelimit() * this.databean.getFpagelimit()
				+ 1);

		this.databean.setFendpage(this.databean.getFstartpage()
				+ this.databean.getFpagelimit() - 1);

		if (this.databean.getFtotalpage() < this.databean.getFendpage()) {
			this.databean.setFendpage(this.databean.getFtotalpage());
			System.out.println(this.databean.getFtotalpage() + ":토탈토탈");
		}

		//System.out.println(this.databean.getFend() + ":엔드엔드");

		this.databean.setFreeboard(sqlSessionTemplate.selectList("mm.fboard",
				this.databean));

	}

	public void freedetail() {

		this.sqlSessionTemplate.update("mm.freecnt", this.databean);

		this.databean.setFreeboard(sqlSessionTemplate.selectList("mm.fdetail",
				this.databean));

	}

	public void freewriteform() {
	}

	public void freewrite() {

		this.file
				.freeboardInput(
						this.databean.getFupfileResult(),
						"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\freeboard\\img\\");

		this.databean.setFreeboard(this.sqlSessionTemplate.selectOne(
				"mm.freemaxids", this.databean));

		if (this.databean.getFreeboard() == null
				|| this.databean.getFreeboard().equals("null")) {

			this.databean.setFuserid(this.databean.getFuserid());
			this.databean.setFcontent(this.databean.getFcontent());
			this.databean.setFtitle(this.databean.getFtitle());
			sqlSessionTemplate.insert("mm.freenull", this.databean);

		} else {
			this.databean.setFuserid(databean.getFuserid());
			this.databean.setFcontent(databean.getFcontent());
			this.databean.setFtitle(databean.getFtitle());
			sqlSessionTemplate.insert("mm.freeboardinsert", this.databean);
		}
		this.sqlSessionTemplate.update("mm.freecnt", this.databean);
		// this.databean.setFreeboard(sqlSessionTemplate.selectList("mm.fdetail",this.databean));
		this.databean.setMain("comView");
		this.comSerch();

		//System.out.println(this.databean.getFupfileResult() + ": 업파일");
	}

	public void freereplyform() {
	}

	public void freereplywrite() {

		this.databean.setFreeboard(this.sqlSessionTemplate.selectOne("mm.fdetail", this.databean));
		this.databean.setFgid(((DataBean) this.databean.getFreeboard()).getFgid());
		this.databean.setFseq(((DataBean) this.databean.getFreeboard()).getFseq());
		this.databean.setFref(((DataBean) this.databean.getFreeboard()).getFref());

		sqlSessionTemplate.update("mm.freereply", this.databean);

		this.databean.setFreeboard(this.sqlSessionTemplate.selectOne("mm.fdetail", this.databean));
		
		this.databean.setFseq(((DataBean) this.databean.getFreeboard()).getFseq() + 1);
		this.databean.setFref(((DataBean) this.databean.getFreeboard()).getFref() + 1);
		this.sqlSessionTemplate.insert("mm.freereplycom", this.databean);
		this.sqlSessionTemplate.update("mm.freecnt", this.databean);
		this.databean.setFreeboard(sqlSessionTemplate.selectList("mm.fdetail",this.databean));
	}

	public void freemodifyform() {
		this.databean.setFreeboard(sqlSessionTemplate.selectOne("mm.fdetail",
				this.databean));
		this.databean.setFtitle(((DataBean) this.databean.getFreeboard())
				.getFtitle());
		this.databean.setFcontent(((DataBean) this.databean.getFreeboard())
				.getFcontent());
	}

	public void freemodifywrite() {
		this.file
				.freeboardInput(
						this.databean.getFupfileResult(),
						"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\freeboard\\img\\");
		// String path =
		// "C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\freeboard\\img\\";

		// this.file.freeboardInput(this.databean.getFupfileResult(),path);
		this.databean
				.setFupfileResult(((DataBean) this.databean.getFreeboard())
						.getUpfileList());
		this.file
				.roomDeleteFile(
						this.databean.getFupfileResult(),
						"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\freeboard\\img\\");
		this.databean.setFupfile(this.databean.getFupfile());
		this.sqlSessionTemplate.update("mm.freemodifyupdate", this.databean);
		// this.databean.setFreeboard(sqlSessionTemplate.selectList("mm.fdetail",this.databean));
		this.databean.setMain("comView");
		this.comSerch();
		//System.out.println(this.databean.getFupfile() + ":업파일_모디파이폼");
	}

	public void freedelete() {

		Object data = null;
		data = sqlSessionTemplate.selectOne("mm.Oneman", this.databean);
		// /////////////fids해 해당하는 놈의 정보를 긁어온다

		this.databean.setFupfileResult(((DataBean) data).getUpfileList());
		this.databean.setFgid(((DataBean) data).getFgid());
		this.databean.setFids(((DataBean) data).getFids());
		this.databean.setFseq(((DataBean) data).getFseq());

		Integer res = null;
		res = sqlSessionTemplate
				.selectOne("mm.freedeleteselect", this.databean);

		if (res != null) {

			if (res < 2 && this.databean.getFseq() == 0) {
				this.sqlSessionTemplate.delete("mm.freedelete", this.databean);

				this.file
						.roomDeleteFile(
								this.databean.getFupfileResult(),
								"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\freeboard\\img\\");
			} else if (res > 1 && this.databean.getFseq() == 0) {
				this.file
						.roomDeleteFile(
								this.databean.getFupfileResult(),
								"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\freeboard\\img\\");
				this.databean.setFtitle("삭제된게시물입니다");
				this.databean.setFcontent("");
				sqlSessionTemplate.update("mm.freedeleteUp", this.databean);
			} else {
				this.file
						.roomDeleteFile(
								this.databean.getFupfileResult(),
								"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\freeboard\\img\\");
				this.sqlSessionTemplate.delete("mm.freedelete", this.databean);

				res = null;
				res = sqlSessionTemplate.selectOne("mm.freedeleteselect",
						this.databean);

				//System.out.println(res + "               엘즈문안의 레스");
				if (res == 1) {
					DataBean check = new DataBean();
					System.out.println(this.databean.getTitles()
							+ "                         겟타이틀즈");
					check.setInsertboard((List) sqlSessionTemplate.selectList(
							"mm.fcheck", this.databean));
					for (int i = 0; i < check.getInsertboard().size(); i++) {
						if (check.getInsertboard().get(i).getFtitle()
								.equals(this.databean.getTitles())
								&& check.getInsertboard().get(i).getFseq()
										.equals(0)) {

							this.databean.setFids(check.getInsertboard().get(i)
									.getFids());

							this.sqlSessionTemplate.delete("mm.freedelete",
									this.databean);
						}

					}

				}

			}

		}
		this.databean.setFreeboard(sqlSessionTemplate.selectList("mm.fboard",
				this.databean));
	}

}