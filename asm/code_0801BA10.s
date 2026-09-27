	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BA10
sub_0801BA10: @ 0x0801BA10
	push {lr}
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	ldr r2, _0801BA4C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _0801BA50 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	pop {r1}
	bx r1
	.align 2, 0
_0801BA4C: .4byte 0x03002870
_0801BA50: .4byte 0x02022860
