	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1C44
sub_080A1C44: @ 0x080A1C44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r2, _080A1C78 @ =0x03005E70
	movs r1, #0xc8
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r4, _080A1C7C @ =0x0203ECC8
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0xc8
	bl _call_via_r3
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A1C80
	adds r0, r4, #0
	adds r1, r5, #0
	bl SioStrCpy
	movs r0, #1
	b _080A1C82
	.align 2, 0
_080A1C78: .4byte 0x03005E70
_080A1C7C: .4byte 0x0203ECC8
_080A1C80:
	movs r0, #0
_080A1C82:
	pop {r4, r5}
	pop {r1}
	bx r1
