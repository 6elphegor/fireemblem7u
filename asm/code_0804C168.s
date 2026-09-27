	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804C168
sub_0804C168: @ 0x0804C168
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _0804C184
	movs r0, #0xb
	strh r0, [r5]
	movs r0, #0xa
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	b _0804C1CA
_0804C184:
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	movs r0, #0x64
	ldrh r1, [r5]
	adds r4, r1, #0
	muls r4, r0, r4
	subs r4, r6, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	strh r0, [r5, #2]
	lsls r0, r0, #2
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	lsls r0, r0, #1
	subs r4, r4, r0
	strh r4, [r5, #4]
	adds r1, r2, #0
	ldrh r2, [r5]
	adds r0, r1, r2
	cmp r0, #0
	bne _0804C1C0
	movs r0, #0xb
	strh r0, [r5, #2]
_0804C1C0:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0804C1CA
	movs r0, #0xb
	strh r0, [r5]
_0804C1CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
