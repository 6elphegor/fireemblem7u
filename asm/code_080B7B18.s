	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7B18
sub_080B7B18: @ 0x080B7B18
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r2, #1
	movs r3, #0
	strh r2, [r0]
	ldr r0, _080B7B6C @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _080B7B64
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _080B7B70 @ =sub_080B77DC
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl Proc_Break
_080B7B64:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7B6C: .4byte 0x03002870
_080B7B70: .4byte sub_080B77DC
