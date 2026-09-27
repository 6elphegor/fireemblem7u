	.include "macro.inc"

	.syntax unified

	thumb_func_start PutDigits
PutDigits: @ 0x08013350
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r3, #0
	ble _08013374
	movs r2, #0
_0801335C:
	strh r2, [r0]
	subs r0, #2
	subs r3, #1
	cmp r3, #0
	bne _0801335C
	b _08013374
_08013368:
	ldrb r2, [r1]
	adds r0, r2, r5
	subs r0, #0x30
	strh r0, [r4]
	subs r4, #2
	subs r1, #1
_08013374:
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _08013368
	pop {r4, r5}
	pop {r0}
	bx r0
