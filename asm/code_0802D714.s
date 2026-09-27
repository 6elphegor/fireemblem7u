	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxSandStorm_VSync
WfxSandStorm_VSync: @ 0x0802D714
	push {r4, r5, lr}
	bl GetOamSplice
	cmp r0, #0
	beq _0802D758
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802D760 @ =0x020027DC
	adds r4, r1, r0
	movs r5, #0x1f
_0802D732:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	movs r1, #0xff
	ands r0, r1
	subs r0, #0x10
	ldr r1, _0802D764 @ =0x000001FF
	ands r0, r1
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _0802D768 @ =0x08B905C0
	ldr r3, _0802D76C @ =0x0000101C
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D732
_0802D758:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D760: .4byte 0x020027DC
_0802D764: .4byte 0x000001FF
_0802D768: .4byte 0x08B905C0
_0802D76C: .4byte 0x0000101C
