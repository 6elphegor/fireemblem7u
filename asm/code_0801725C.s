	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemType
GetItemType: @ 0x0801725C
	cmp r0, #0
	beq _08017278
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017274 @ =0x08BE222C
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	b _0801727A
	.align 2, 0
_08017274: .4byte 0x08BE222C
_08017278:
	movs r0, #0xff
_0801727A:
	bx lr
