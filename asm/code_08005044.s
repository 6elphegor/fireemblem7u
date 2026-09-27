	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005044
sub_08005044: @ 0x08005044
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_0800502C
	movs r6, #7
	b _08005056
_08005050:
	subs r6, #1
	cmp r6, #0
	blt _08005074
_08005056:
	ldr r4, _0800507C @ =0x02028D44
	adds r4, r6, r4
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _08005050
_08005074:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800507C: .4byte 0x02028D44
