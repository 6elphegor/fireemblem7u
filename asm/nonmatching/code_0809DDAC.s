	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809DDAC
sub_0809DDAC: @ 0x0809DDAC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0809DDD8
	adds r4, r2, #0
_0809DDBE:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0809DD7C
	ldr r1, _0809DDE0 @ =0x02014438
	adds r1, r5, r1
	strb r0, [r1]
	adds r4, #2
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809DDBE
_0809DDD8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809DDE0: .4byte 0x02014438
