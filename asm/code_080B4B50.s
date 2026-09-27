	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4B50
sub_080B4B50: @ 0x080B4B50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B4B88 @ =0x08CE76C8
	bl Proc_Find
	cmp r0, #0
	beq _080B4B80
	ldr r1, [r0, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4B80
	ldr r0, [r0, #0x58]
	ldr r1, [r0, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1, #0x22]
	orrs r0, r2
	strh r0, [r1, #0x22]
_080B4B80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4B88: .4byte 0x08CE76C8
