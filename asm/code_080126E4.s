	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080126E4
sub_080126E4: @ 0x080126E4
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _0801270C @ =0x02022860
	ldr r2, _08012710 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _08012714 @ =EndProcIfNotMarkedB
	bl Proc_ForAll
	ldr r0, _08012718 @ =OnMain
	bl SetMainFunc
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801270C: .4byte 0x02022860
_08012710: .4byte 0x01000100
_08012714: .4byte EndProcIfNotMarkedB
_08012718: .4byte OnMain
