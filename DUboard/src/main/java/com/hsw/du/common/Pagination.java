package com.hsw.du.common;

public class Pagination {
	//�� �������� ������ ��� ����
	private int listSize = 5;
	// �� ������ ������ ������ ������ ����
	private int rangeSize = 5;
	// ���� ������
	private int page;
	// ���� ������ ����
	private int range;
	// �� �Խù� ��
	private int listCnt;
	// �� ������ ������ ����
	private int pageCnt;
	// �� ������ ������ ���� ��ȣ
	private int startPage;
	// �� ������ ������ �� ��ȣ
	private int endPage; 
	private int startList;
	// ���� ������
	private boolean prev;
	//���� ������
	private boolean next;
	
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartList() {
		return startList;
	}
	public void setStartList(int startList) {
		this.startList = startList;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		// �� ������ ������ ����
		this.pageCnt = (int)Math.ceil((float)listCnt / listSize);
		
		// ���۹�ȣ
		this.startPage = (range - 1) * rangeSize + 1;
		
		//����ȣ
		this.endPage = range * rangeSize;
		
		// Mapper�� ����� Limit ���۹�ȣ
		this.startList = (page - 1) * listSize;
		
		// ������ư
		this.prev = range == 1 ? false : true;
		
		// ������ư
		this.next = endPage > pageCnt ? false : true;
		if(endPage >= pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}
