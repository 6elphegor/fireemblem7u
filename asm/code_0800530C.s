	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800530C
sub_0800530C: @ 0x0800530C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	b _0800533E
_08005316:
	cmp r0, #0x60
	bls _0800531E
	subs r0, #0x40
	b _08005320
_0800531E:
	subs r0, #0x20
_08005320:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0800534C @ =0x02028D50
	ldr r3, [r0]
	adds r3, r1, r3
	ldr r0, _08005350 @ =0x02028D54
	ldr r0, [r0]
	adds r3, r3, r0
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _08005354 @ =0x08B905B0
	bl PutOamHiRam
	adds r5, #8
	adds r4, #1
_0800533E:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005316
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800534C: .4byte 0x02028D50
_08005350: .4byte 0x02028D54
_08005354: .4byte 0x08B905B0
