	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemAfterUse
GetItemAfterUse: @ 0x08016730
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016758 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08016752
	ldr r0, _0801675C @ =0xFFFFFF00
	adds r2, r2, r0
	cmp r2, #0xff
	ble _08016760
_08016752:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _08016762
	.align 2, 0
_08016758: .4byte 0x08BE222C
_0801675C: .4byte 0xFFFFFF00
_08016760:
	movs r0, #0
_08016762:
	bx lr
