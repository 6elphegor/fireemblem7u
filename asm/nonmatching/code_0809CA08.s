	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809CA08
sub_0809CA08: @ 0x0809CA08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _0809CA30
	adds r7, r5, #0
	adds r7, #0x47
	adds r6, r0, #0
_0809CA1C:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809CA1C
_0809CA30:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
