	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4F9C
sub_080B4F9C: @ 0x080B4F9C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r0, _080B4FE0 @ =0x08CE76E8
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080B4FD8
	bl WmGetCameraX
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	bl WmGetCameraY
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x50
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	strh r7, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080B4FD8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4FE0: .4byte 0x08CE76E8
