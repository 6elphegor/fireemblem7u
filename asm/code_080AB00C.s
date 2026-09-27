	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayNextShuffledSong
PlayNextShuffledSong: @ 0x080AB00C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AB044 @ =0x08CE5490
	adds r1, r4, #0
	bl Proc_Start
	adds r4, #0x31
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r4]
	ldr r0, _080AB048 @ =0x08CE548C
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080AB038
	cmp r2, #0x80
	bne _080AB03C
_080AB038:
	movs r0, #0
	strb r0, [r4]
_080AB03C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB044: .4byte 0x08CE5490
_080AB048: .4byte 0x08CE548C
