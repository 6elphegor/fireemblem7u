	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809CB8C
sub_0809CB8C: @ 0x0809CB8C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl InitSupportSubScreenPartners
	adds r0, r4, #0
	bl sub_0809CA08
	adds r0, r4, #0
	bl sub_0809CA38
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_0809CB10
	pop {r4}
	pop {r0}
	bx r0
