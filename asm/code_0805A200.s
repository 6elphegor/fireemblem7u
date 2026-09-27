	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A200
sub_0805A200: @ 0x0805A200
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805A238 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A23C @ =0x08BA2408
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805A240 @ =0x081E865A
	str r1, [r0, #0x48]
	ldr r1, _0805A244 @ =0x08BA2690
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805A248 @ =0x08BA2420
	str r1, [r0, #0x54]
	ldr r1, _0805A24C @ =0x08BA2558
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A238: .4byte 0x0201774C
_0805A23C: .4byte 0x08BA2408
_0805A240: .4byte 0x081E865A
_0805A244: .4byte 0x08BA2690
_0805A248: .4byte 0x08BA2420
_0805A24C: .4byte 0x08BA2558
