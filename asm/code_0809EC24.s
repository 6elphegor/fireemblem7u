	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTotalAverageSupportValue
GetTotalAverageSupportValue: @ 0x0809EC24
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0809EC2C @ =0x08C9F9F4
	b _0809EC3C
	.align 2, 0
_0809EC2C: .4byte 0x08C9F9F4
_0809EC30:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetUnitsAverageSupportValue
	adds r5, r5, r0
	adds r4, #0x14
_0809EC3C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809EC30
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
