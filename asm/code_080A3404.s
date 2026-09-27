	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenu_StartHelpBox
SaveMenu_StartHelpBox: @ 0x080A3404
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A341A
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r1, [r0]
	cmp r1, #0
	bne _080A3428
_080A341A:
	bl CloseHelpBox
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	b _080A3464
_080A3428:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0x10
	beq _080A3440
	cmp r1, #0x10
	bgt _080A343C
	cmp r1, #2
	beq _080A3440
	b _080A3464
_080A343C:
	cmp r1, #0x20
	bne _080A3464
_080A3440:
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3464
	adds r4, #0x3e
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A3464
	ldr r0, _080A346C @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r2, _080A3470 @ =0x000003B2
	movs r0, #0x30
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	movs r0, #1
	strb r0, [r4]
_080A3464:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A346C: .4byte 0x06013800
_080A3470: .4byte 0x000003B2
