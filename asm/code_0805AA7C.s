	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805AA7C
sub_0805AA7C: @ 0x0805AA7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805AAC0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AAC4 @ =0x08BA2930
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805AAC8 @ =0x081E895A
	str r1, [r0, #0x48]
	ldr r1, _0805AACC @ =0x08BA2948
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805AAD0 @ =0x08BA2954
	str r1, [r0, #0x54]
	ldr r0, _0805AAD4 @ =0x0828D4A8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AAC0: .4byte 0x0201774C
_0805AAC4: .4byte 0x08BA2930
_0805AAC8: .4byte 0x081E895A
_0805AACC: .4byte 0x08BA2948
_0805AAD0: .4byte 0x08BA2954
_0805AAD4: .4byte 0x0828D4A8
