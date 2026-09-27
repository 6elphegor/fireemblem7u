	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrTogiInit_Init
ekrTogiInit_Init: @ 0x080555C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl InitOam
	ldr r1, _08055634 @ =0x02017744
	ldr r0, _08055638 @ =0x0203E00C
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	bl EfxClearScreenFx
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl NewEkrDispUP
	bl NewEkrBattle
	ldr r0, _0805563C @ =0x081DE59C
	ldr r4, _08055640 @ =0x02022920
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	subs r4, #0xc0
	ldr r5, _08055644 @ =0x020165C8
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	mov r0, r8
	bl Proc_Break
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055634: .4byte 0x02017744
_08055638: .4byte 0x0203E00C
_0805563C: .4byte 0x081DE59C
_08055640: .4byte 0x02022920
_08055644: .4byte 0x020165C8
