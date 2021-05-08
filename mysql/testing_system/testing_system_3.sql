------- testing assignmennt 3-----
-- cau 1:them it nhat 10 record vao table
--- cau2: lấy ra tất cả các phòng ban
Select *
from department;
--- cau 3:lấy ra id của phong ban sale
Select departmentID
from department
where departmentName='sale';

-- cau 4: lấy ra thông tin account có full name dài nhất 
Select		* 
from		`Account` 
where 		LENGTH(Fullname) = (select MAX(LENGTH(Fullname)) from `Account`);
-- cau 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
Select		* 
from		`Account` 
where 		LENGTH(Fullname) = (select MAX(LENGTH(Fullname)) from `Account`) and departmentID=3;

-- cau 6: lấy ra tên group đã tham gia trước ngày 20/12/2019
select 	Groupname
from 	`Group`
where 	CreateDate <'20/12/2019'>;
-- cau 7: Lấy ra ID của question có >= 4 câu trả lời
select 		QuestionID
from		Answer
group by 	QuestionID
having		COUNT(QuestionID) >= 4;

-- cau 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
select 		`Code` 
from		Exam
where 		Duration >= 60 and CreateDate < '2019-12-20';

-- cau 9: Lấy ra 5 group được tạo gần đây nhất
select 		* 
from 		`Group`
order by 	CreateDate DESC 
limit 5;

-- cau 10: Đếm số nhân viên thuộc department có id = 2
select 	COUNT(AccountID) AS 'SO NHAN VIEN' 
from 		`Account`
where 		DepartmentID = 2;

-- cau 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
select 		Fullname 
from 		`Account`
where 		(SUBSTRING_INDEX(FullName, ' ', -1)) like 'D%o' ;

-- cau 12: xóa tất cả các exam được tạo trước ngày 20/12/2019
delete
from 		Exam 
where 		CreateDate < '2019-12-20';

-- cau 13: xóa tất cả các Account có FullName bắt đầu bằng 2 từ "Nguyễn Hải"
delete 
from 		`Account`
where 		(SUBSTRING_INDEX(FullName,' ',2)) = 'Nguyễn Hải';


-- cau 15: update account có id = 5 sẽ thuộc group có id = 4
update 		`GroupAccount` 
set 		AccountID = 5 
where 		GroupID = 4;
