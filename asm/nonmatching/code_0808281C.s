	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawHelpBoxWeaponLabels
DrawHelpBoxWeaponLabels: @ 0x0808281C
	push {r4, lr}
	ldr r4, _08082898 @ =0x0203E6B8
	bl GetItemType
	bl GetItemKindString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _0808289C @ =0x0000110C
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828A0 @ =0x0000110E
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #8
	bl Text_InsertDrawString
	adds r4, #8
	ldr r0, _080828A4 @ =0x0000110F
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828A8 @ =0x00001104
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828AC @ =0x0000110D
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #8
	bl Text_InsertDrawString
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082898: .4byte 0x0203E6B8
_0808289C: .4byte 0x0000110C
_080828A0: .4byte 0x0000110E
_080828A4: .4byte 0x0000110F
_080828A8: .4byte 0x00001104
_080828AC: .4byte 0x0000110D
