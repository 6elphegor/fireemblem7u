	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvupFanMain
EkrLvupFanMain: @ 0x0804C0D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0804C100
	ldr r4, _0804C0FC @ =0x0000037B
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	b _0804C112
	.align 2, 0
_0804C0FC: .4byte 0x0000037B
_0804C100:
	cmp r0, #0x74
	bne _0804C112
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
_0804C112:
	pop {r4}
	pop {r0}
	bx r0
