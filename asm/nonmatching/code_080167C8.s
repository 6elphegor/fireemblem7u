	.include "macro.inc"

	.syntax unified

	thumb_func_start IsItemCoveringRange
IsItemCoveringRange: @ 0x080167C8
	adds r3, r1, #0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080167EC @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	lsrs r1, r0, #4
	movs r2, #0xf
	ands r2, r0
	cmp r1, r3
	bgt _080167F0
	cmp r3, r2
	bgt _080167F0
	movs r0, #1
	b _080167F2
	.align 2, 0
_080167EC: .4byte 0x08BE222C
_080167F0:
	movs r0, #0
_080167F2:
	bx lr
