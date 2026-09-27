	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801FAD4
sub_0801FAD4: @ 0x0801FAD4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetGameTime
	adds r4, r0, #0
	movs r0, #3
	ands r4, r0
	cmp r4, #0
	bne _0801FB30
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801FB30
	ldr r2, _0801FB38 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _0801FB3C @ =0x02022860
	strh r4, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
_0801FB30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FB38: .4byte 0x03002870
_0801FB3C: .4byte 0x02022860
