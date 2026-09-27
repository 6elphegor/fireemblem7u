	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B21C0
sub_080B21C0: @ 0x080B21C0
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080B21E8 @ =0x0203EEA4
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r0, _080B21E8 @ =0x0203EEA4
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bne _080B21EC
	movs r0, #0
	b _080B2242
	.align 2, 0
_080B21E8: .4byte 0x0203EEA4
_080B21EC:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	cmp r0, r1
	ble _080B21F8
	movs r0, #0
	b _080B2242
_080B21F8:
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bge _080B221C
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _080B220A
	movs r0, #0
	b _080B2242
_080B220A:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B221A
	movs r0, #1
	rsbs r0, r0, #0
	b _080B2242
_080B221A:
	b _080B223E
_080B221C:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	cmp r0, r1
	bne _080B222C
	movs r0, #0
	b _080B2242
_080B222C:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	ldr r2, [r7, #8]
	subs r1, r2, #1
	cmp r0, r1
	blt _080B223E
	movs r0, #1
	b _080B2242
_080B223E:
	movs r0, #0
	b _080B2242
_080B2242:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
