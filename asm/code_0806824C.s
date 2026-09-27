	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrClassChg
NewEkrClassChg: @ 0x0806824C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl NewEfxSpellCast
	ldr r4, _08068274 @ =0x020200A8
	ldr r0, _08068278 @ =0x08BDB398
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068274: .4byte 0x020200A8
_08068278: .4byte 0x08BDB398
