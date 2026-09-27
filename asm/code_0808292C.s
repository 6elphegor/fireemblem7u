	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawHelpBoxStaffLabels
DrawHelpBoxStaffLabels: @ 0x0808292C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08082984 @ =0x0203E6B8
	ldr r0, _08082988 @ =0x00001115
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetWeaponLevelStringFromExp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawString
	ldr r0, _0808298C @ =0x0000110C
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x44
	movs r2, #7
	bl Text_InsertDrawString
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08082984: .4byte 0x0203E6B8
_08082988: .4byte 0x00001115
_0808298C: .4byte 0x0000110C
