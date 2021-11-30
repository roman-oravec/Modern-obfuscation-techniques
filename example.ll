@.str = private unnamed_addr constant [12 x i8] c"Hello world\00", align 1

define i32 @foo() {
entry:
  %add = add i32 7, 42
  %cmp = icmp sgt i32 %add, 56
  br i1 %cmp, label %if.then, label %if.end

if.then:                                    
  br label %return

if.end:                                         
  br label %return

return:                                 
  %retval.0 = phi i32 [7, %if.then], [%add, %if.end]
  ret i32 %retval.0
}

define i32 @main() {
entry:
  %call = call i32 @puts(i8* getelementptr inbounds([8 x i8], [8 x i8]* @.str, i64 0, i64 0))
  %call1 = call i32 @foo()
  ret i32 0
}

declare dso_local i32 @puts(i8*)