	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8358
sub_080B8358: @ 0x080B8358
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	ldr r1, [r0]
	ldrb r5, [r1, #4]
	bl GetUnitASupporterPid
	adds r2, r0, #0
	cmp r2, #0
	bne _080B838C
	b _080B8392
_080B836E:
	movs r0, #1
	b _080B8394
_080B8372:
	ldrb r0, [r4, #1]
	adds r1, r0, #0
	cmp r1, r5
	bne _080B8380
	ldrb r0, [r4, #2]
	cmp r0, r2
	beq _080B836E
_080B8380:
	cmp r1, r2
	bne _080B838A
	ldrb r0, [r4, #2]
	cmp r0, r5
	beq _080B836E
_080B838A:
	adds r4, #8
_080B838C:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080B8372
_080B8392:
	movs r0, #0
_080B8394:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
