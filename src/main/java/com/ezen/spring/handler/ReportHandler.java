package com.ezen.spring.handler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ezen.spring.dao.ReportDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Component
public class ReportHandler {

    private final ReportDAO rdao;

    // 매일 오전 9시, 오후 9시에 실행
    @Scheduled(cron = "00 00 10 * * *")
    public void reportHandelr() {
		log.info(">>>> ReportHandelr Running Start > {}", LocalDateTime.now());

        // 신고가 5개 이상인 게시판을 찾는 쿼리 실행
        List<Long> bnoList = rdao.findReport();
        
        if (bnoList.isEmpty()) {
            log.info(">>>> 5회 이상 신고된 게시글이 없습니다. > {}", LocalDateTime.now());
            return;
        }

        // 각 게시판에 대해 알림 생성
        for (Long bno : bnoList) {
            String alertMsg = "게시판에 신고가 5개 이상 접수되었습니다.";
            rdao.statusReview(bno);
            rdao.insertAlert(bno, alertMsg);
            log.info("Admin alert created for board_id: {}", bno);
        }
        
		log.info(">>>> ReportHandelr Running End > {}", LocalDateTime.now());
    }
}