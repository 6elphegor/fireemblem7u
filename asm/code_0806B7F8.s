	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806B7F8
sub_0806B7F8: @ 0x0806B7F8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitOam
	bl EfxClearScreenFx
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl NewEkrDispUP
	bl NewEkrBattle
	ldr r0, _0806B84C @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl PutBanimBG
	ldr r4, _0806B850 @ =0x02022860
	ldr r1, _0806B854 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B84C: .4byte 0x0203E00A
_0806B850: .4byte 0x02022860
_0806B854: .4byte 0x020165C8
