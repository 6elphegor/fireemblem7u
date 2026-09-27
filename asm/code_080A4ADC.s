	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4ADC
sub_080A4ADC: @ 0x080A4ADC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0x20
	strh r0, [r1]
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080A4B04
	bl EndSpriteAnimProc
_080A4B04:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #4
	beq _080A4B30
	cmp r0, #4
	bgt _080A4B18
	cmp r0, #2
	beq _080A4B28
	b _080A4B40
_080A4B18:
	cmp r0, #8
	beq _080A4B38
	cmp r0, #0x20
	bne _080A4B40
	adds r0, r4, #0
	bl sub_080ADAF8
	b _080A4B40
_080A4B28:
	adds r0, r4, #0
	bl StartSoundRoomScreen
	b _080A4B40
_080A4B30:
	adds r0, r4, #0
	bl sub_0809BE68
	b _080A4B40
_080A4B38:
	ldr r0, _080A4B48 @ =0x08CC51D0
	adds r1, r4, #0
	bl Proc_StartBlocking
_080A4B40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4B48: .4byte 0x08CC51D0
