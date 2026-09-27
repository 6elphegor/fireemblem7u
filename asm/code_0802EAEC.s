	.include "macro.inc"

	.syntax unified

	thumb_func_start GetClassBestWRankType
GetClassBestWRankType: @ 0x0802EAEC
	push {r4, lr}
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0
	adds r4, r0, #0
	adds r4, #0x2c
_0802EAFA:
	cmp r1, #4
	beq _0802EB0A
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802EB0A
	adds r2, r0, #0
	adds r3, r1, #0
_0802EB0A:
	adds r1, #1
	cmp r1, #7
	ble _0802EAFA
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
