	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxFlashBgMain
EfxFlashBgMain: @ 0x0804F0B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804F0E4 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804F0DC
	adds r0, r4, #0
	bl Proc_Break
_0804F0DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F0E4: .4byte 0x020165C8
