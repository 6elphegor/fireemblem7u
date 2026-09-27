	.include "macro.inc"

	.syntax unified

	thumb_func_start RenderMapForFade
RenderMapForFade: @ 0x08019584
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBgChrOffset
	ldr r1, _080195E8 @ =0x0202BBB8
	ldrh r2, [r1, #0xc]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #0xe]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x26]
	movs r5, #9
	adds r7, r1, #0
_080195A8:
	movs r4, #0xe
	subs r6, r5, #1
_080195AC:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _080195EC @ =0x02023C60
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutMapMetatile
	subs r4, #1
	cmp r4, #0
	bge _080195AC
	adds r5, r6, #0
	cmp r5, #0
	bge _080195A8
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080195E8: .4byte 0x0202BBB8
_080195EC: .4byte 0x02023C60
