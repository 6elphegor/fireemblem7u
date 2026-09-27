	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4738
sub_080B4738: @ 0x080B4738
	push {r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r1, _080B47D4 @ =0x085E9A68
	mov r0, sp
	movs r2, #0x37
	bl memcpy
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080B475A
	movs r0, #0
	strh r0, [r5, #0x30]
_080B475A:
	ldrh r0, [r5, #0x30]
	add r0, sp
	ldrb r0, [r0]
	lsls r4, r0, #5
	ldr r0, _080B47D8 @ =0x0842513C
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B47DC @ =0x084250BC
	adds r4, r4, r0
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	adds r6, r5, #0
	adds r6, #0x44
	adds r7, r5, #0
	adds r7, #0x47
_080B478A:
	ldr r1, [r5, #0x38]
	adds r0, r4, #0
	bl sub_080B437C
	adds r4, #1
	cmp r4, #3
	ble _080B478A
	movs r4, #0
_080B479A:
	ldr r1, [r5, #0x3c]
	adds r0, r4, #0
	bl sub_080B437C
	adds r4, #1
	cmp r4, #4
	ble _080B479A
	adds r0, r5, #0
	bl sub_080B43EC
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _080B47BC
	adds r0, r5, #0
	bl sub_080B4510
_080B47BC:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _080B47CA
	adds r0, r5, #0
	bl sub_080B467C
_080B47CA:
	add sp, #0x38
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B47D4: .4byte 0x085E9A68
_080B47D8: .4byte 0x0842513C
_080B47DC: .4byte 0x084250BC
