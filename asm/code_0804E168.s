	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E168
sub_0804E168: @ 0x0804E168
	push {r4, r5, lr}
	adds r4, r0, #0
	bl IsEventRunning
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _0804E1C0
	bl PlayDeathSoundForArena
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl NewEfxDead
	bl EfxPrepareScreenFx
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E1C8 @ =0x0203E010
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl DisableEkrGauge
	bl UnAsyncEkrDispUP
	bl EkrGauge_0804CC28
	adds r0, r4, #0
	bl Proc_Break
_0804E1C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E1C8: .4byte 0x0203E010
