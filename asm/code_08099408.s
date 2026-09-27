	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099408
sub_08099408: @ 0x08099408
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #3
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	bne _0809944E
	movs r0, #0
	ldrsh r4, [r4, r0]
	cmp r4, #0
	bge _0809942A
	adds r4, #3
_0809942A:
	asrs r4, r4, #2
	lsls r0, r4, #5
	ldr r1, _08099454 @ =0x0840E978
	adds r0, r0, r1
	ldr r1, [r5, #0x58]
	lsls r1, r1, #5
	ldr r2, _08099458 @ =0x02022A60
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	cmp r4, #5
	bne _0809944E
	adds r0, r5, #0
	bl Proc_Break
_0809944E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099454: .4byte 0x0840E978
_08099458: .4byte 0x02022A60
